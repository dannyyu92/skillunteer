Given /the following organizations exist:/ do |charity_table|
	charity_table.hashes.each do |charity|
	Charity.create charity
	end
end
