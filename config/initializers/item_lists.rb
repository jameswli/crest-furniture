# These are used to provide constraints for user data

US_STATES = [ ["Alabama", "AL"], ["Alaska", "AK"], ["Arizona", "AZ"], ["Arkansas", "AR"], ["California", "CA"], 
["Colorado", "CO"], ["Connecticut", "CT"], ["Delaware", "DE"], ["District Of Columbia", "DC"], 
["Florida", "FL"], ["Georgia", "GA"], ["Hawaii", "HI"], ["Idaho", "ID"], ["Illinois", "IL"], 
["Indiana", "IN"], ["Iowa", "IA"], ["Kansas", "KS"], ["Kentucky", "KY"], ["Louisiana", "LA"], 
["Maine", "ME"], ["Maryland", "MD"], ["Massachusetts", "MA"], ["Michigan", "MI"], ["Minnesota", "MN"],
["Mississippi", "MS"], ["Missouri", "MO"], ["Montana", "MT"], ["Nebraska", "NE"], ["Nevada", "NV"], 
["New Hampshire", "NH"], ["New Jersey", "NJ"], ["New Mexico", "NM"], ["New York", "NY"], 
["North Carolina", "NC"], ["North Dakota", "ND"], ["Ohio", "OH"], ["Oklahoma", "OK"], ["Oregon", "OR"], 
["Pennsylvania", "PA"], ["Rhode Island", "RI"], ["South Carolina", "SC"], ["South Dakota", "SD"], 
["Tennessee", "TN"], ["Texas", "TX"], ["Utah", "UT"], ["Vermont", "VT"], ["Virginia", "VA"], 
["Washington", "WA"], ["West Virginia", "WV"], ["Wisconsin", "WI"], ["Wyoming", "WY"],
["American Samoa", "AS"], ["Guam", "GU"], ["Northern Mariana Islands", "MP"], ["Puerto Rico", "PR"], 
["Virgin Islands", "VI"], ["U.S. Minor Outlying Islands", "UM"], ["Federated States of Micronesia", "FM"], 
["Marshall Islands", "MH"], ["Palau", "PW"], ["Armed Forces - Americas", "AA"], 
["Armed Forces - Europe, Canada, Middle East, Africa", "AE"], ["Armed Forces - Pacific", "AP"] ]
PROJECT_TYPES = [ "Purchase", "Rental", "Purchase/Rental" ]
PURCHASE_PROJECT_STAGES = ["Pre-Design", "Awaiting Design", "Contracting", "Awaiting Delivery", "Awaiting Installation",
 "Punch List", "Complete", "Cancelled"]
RENTAL_PROJECT_STAGES = ["Pre-Design", "Awaiting Design", "Contracting", "Awaiting Installation", "Punch List",
 "In Rental", "Complete", "Cancelled"]
PURCHASE_RENTAL_PROJECT_STAGES = ["Pre-Design", "Awaiting Design", "Contracting", 
	"Awaiting Preliminary Installation", "Preliminary Punch List", 
	"Awaiting Delivery", "Awaiting Final Installation", "Punch List", "Complete", "Cancelled"]
INVENTORY_ITEM_CONDITONS = [ "New", "Excellent", "Good", "Adequate", "Poor", "Damaged" ]
INVENTORY_ITEM_STATUSES = [ "Checked In", "Checked Out", "Unavailable" ]
USER_ROLES = [ "Sales", "Customer Service", "Warehouse", "Design" ]
NOTE_TYPES = ["note", "change"]
ATTACHMENT_TYPES = {"document" => [], "document-excel" => ["xls", "xlsx"], "document-pdf" => ["pdf"], 
"document-photoshop" => ["psd", "psb", "eps", "tiff"], "document-powerpoint" => ["ppt", "pptx"], 
"document-text" => ["txt"], "document-word" => ["doc", "docx"], "image" => ["gif", "jpg", "jpeg", "png", "bmp"]}
