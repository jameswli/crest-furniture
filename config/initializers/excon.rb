# Excon (used by Fog, which is used by Carrierwave) doesn't read the SSL certs
# in Windows. This is a hack/workaround. 

if ENV['RAILS_ENV'] != 'production'
	Excon.defaults[:ssl_verify_peer] = false
end
