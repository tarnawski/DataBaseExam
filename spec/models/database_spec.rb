require 'rails_helper'

RSpec.describe Database, type: :model do
     it { should validate_presence_of :name }
     it { should validate_uniqueness_of(:name) }
     it { should validate_presence_of :comment }
     it { should validate_presence_of :host }
     it { should validate_presence_of :username }
     it { should validate_presence_of :password }
     it { should validate_presence_of :database }
end
