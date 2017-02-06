require 'test_helper'

class McryptTest < ActiveSupport::TestCase

	test "should decrypt encrypted value" do
		value = 'testing123'
		encrypted_value = MCRYPT.myencrypt(value)
		assert_equal value, MCRYPT.mydecrypt(encrypted_value)
	end

end
