Given /the following organizations exist/ do |organization_table|
	organization_table.hashes.each do |organization|
	Organization.create organization
	end
end
