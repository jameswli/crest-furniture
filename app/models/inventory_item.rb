class InventoryItem < ActiveRecord::Base

  belongs_to :inventory_style
  belongs_to :project
  has_many :project_items
  has_many :projects, through: :project_items

  def is_available?(start_date, end_date)
  	return false if status == "Unavailable"

  	# Below is a table of the six possible ways that an item could become
  	# unavailable. It should be helpful in testing/debugging the SQL query.
  	#       _________________________________________________________________________
  	#      /d                              #1                                      ???
  	#      ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
  	#                            ________________________________________________
  	#                           /d                      #2                     ???
  	#                           ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
  	#                _________________________________
  	#               /start_date              end_date/
  	#               ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
  	#   ________________     ________________    ________________
  	#  /d     #3      p/    /d     #4      p/   /d     #5      p/
  	#  ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾     ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾    ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
  	#        __________________________________________________
  	#       /d                    #6                         p/
  	#       ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
  	#
  	# stage NOT IN ('Complete', 'Cancelled')						-	Only checks projects that are active
  	# rental_delivery BETWEEN :start_date AND :end_date				-	Catches #2, #4, and #5
  	# rental_pickup BETWEEN :start_date AND :end_date				-	Catches #3 (duplicates catching #4)
  	# rental_delivery <= :start_date AND rental_pickup >= :end_date	-	Catches #6
  	# rental_delivery <= :end_date AND rental_pickup IS NULL		-	Catches #1 (duplicates catching #2)
  	# inventory_items.id = :id										-	Only checks projects that use this item
  	projects = Project.joins(:inventory_items).where("stage NOT IN ('Complete', 'Cancelled') AND 
  		( (rental_delivery BETWEEN :start_date AND :end_date) OR 
  		(rental_pickup BETWEEN :start_date AND :end_date) OR 
  		(rental_delivery <= :start_date AND rental_pickup >= :end_date) OR 
  		(rental_delivery <= :end_date AND rental_pickup IS NULL) ) AND
  		inventory_items.id = :id", {start_date: start_date, end_date: end_date, id: id})

  	return false if projects.any?

  	return true
  end

end
