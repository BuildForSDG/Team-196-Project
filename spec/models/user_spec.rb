require 'rails_helper'

RSpec.describe User, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"

  # TODO: add user records model and uncomment this line 
<<<<<<< HEAD
  # it { should have_many(:records)}
=======
  it { should have_many(:records).dependent(:destroy)}
>>>>>>> 51d28ece6abef00b377b627b29993443467bab82

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }

end
<<<<<<< HEAD
=======

>>>>>>> 51d28ece6abef00b377b627b29993443467bab82
