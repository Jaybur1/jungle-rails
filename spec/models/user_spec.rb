require 'rails_helper'

RSpec.describe User, type: :model do
  

  describe "Validations" do
    it 'Should create a valid User' do
      @user = User.create(
        first_name:"Capitan",
        last_name: "El Capitan",
        email:"capitano@elcapitano.com",
        password: "123456",
        password_confirmation: "123456"
      )
      expect(@user).to be_valid
    end

    it 'Should have password and password_confirmation present' do
      @user = User.create(
        first_name:"Capitan",
        last_name: "El Capitan",
        email:"capitano@elcapitano.com",
        password: "123456",

      )
      expect(@user).to_not be_valid
    end

    it 'Should have matched password and password_confirmation' do
      @user = User.create(
        first_name:"Capitan",
        last_name: "El Capitan",
        email:"capitano@elcapitano.com",
        password: "123456",
        password_confirmation: "not matched"
      )
      expect(@user).to_not be_valid
    end

    it 'Should have a uniqu case insensitive valid email' do
      @user1 = User.create(
        first_name:"Capitan",
        last_name: "El Capitan",
        email:"capitano@elcapitano.com",
        password: "123456",
        password_confirmation: "123456"
      )

      @user2 = User.create(
        first_name:"Capitan",
        last_name: "El Capitan",
        email:"capitano@elcapitano.com",
        password: "123456",
        password_confirmation: "123456"
      )
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages[0]).to eq("Email has already been taken")
    end

    it 'should not be created without a valid Email' do
      @user = User.create(
        first_name:"Capitan",
        last_name: "El Capitan",
      
        password: "123456",
        password_confirmation: "123456"
      )
      expect(@user).to_not be_valid
    end

    it 'should not be created without a valid first_name' do
      @user = User.create(
 
        last_name: "El Capitan",
        email:"capitano@elcapitano.com",
        password: "123456",
        password_confirmation: "123456"
      )
      expect(@user).to_not be_valid
    end

    it 'should not be created without a valid last name ' do
      @user = User.create(
        first_name:"Capitan",
        
        email:"capitano@elcapitano.com",
        password: "123456",
        password_confirmation: "123456"
      )
      expect(@user).to_not be_valid
    end

    it 'should not be created if the length of the password is smaller then 6' do
      @user = User.create(
        first_name:"Capitan",
        last_name: "El Capitan",
        email:"capitano@elcapitano.com",
        password: "123",
        password_confirmation: "123"
      )
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should login with valid email and password' do
      @user = User.create(
        first_name:"Capitan",
        last_name: "El Capitan",
        email:"capitano@elcapitano.com",
        password: "123456",
        password_confirmation: "123456"
      )

      expect(User.authenticate_with_credentials('capitano@elcapitano.com', '123456')).to eq(@user)
    end


    it 'logs in user with correct email in uppercase' do
      @user = User.create(
        first_name:"Capitan",
        last_name: "El Capitan",
        email:"capitano@elcapitano.com",
        password: "123456",
        password_confirmation: "123456"
      )

      expect(User.authenticate_with_credentials('CAPITANO@elcapitano.com', '123456')).to eq(@user)
    end

    it 'should login with valid email + extra speces' do
    @user = User.create(
      first_name:"Capitan",
      last_name: "El Capitan",
      email:"capitano@elcapitano.com",
      password: "123456",
      password_confirmation: "123456"
    )

    expect(User.authenticate_with_credentials('           capitano@elcapitano.com          ', '123456')).to eq(@user)
    end
  end

end
