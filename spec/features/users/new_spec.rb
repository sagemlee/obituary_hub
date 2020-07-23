require "rails_helper"

describe "User registration form" do
  it "Creates a new user" do

    first_name = "Tommy"
    last_name = "Johnson"
    email = "email@email.com"
    password = "password"
    visit "/"
    click_on "Register"
    expect(current_path).to eq("/users/new")


    fill_in :first_name, with: first_name
    fill_in :last_name, with: last_name

    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password

    click_on "Create User"

    expect(current_path).to eq("/profile")

    expect(page).to have_content("Hello #{first_name} #{last_name}, thank you for creating an account")
  end

  it "The users email must be unique" do
    user = User.create({
      first_name: "Bob",
      last_name: "Bobby",
      email: "bob@bobby.com",
      password: "password",
      })

      first_name= "Jim"
      last_name = "Jimmy"
      email = "bob@bobby.com"
      password = "password"

      visit "/"
      click_on "Register"
      expect(current_path).to eq("/users/new")


      fill_in :first_name, with: first_name
      fill_in :last_name, with: last_name

      fill_in :email, with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: password

      click_on "Create User"

      expect(current_path).to eq("/users/new")
      expect(page).to have_content("Email has already been taken")
  end

  it "must fill in all the forms" do
    first_name= "Jim"
    last_name = "Jimmy"
    email = "bob@bobby.com"
    password = "password"

    visit "/"
    click_on "Register"
    expect(current_path).to eq("/users/new")



    fill_in :last_name, with: last_name

    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password

    click_on "Create User"

    expect(current_path).to eq("/users/new")
    expect(page).to have_content("First name can't be blank")
  end

  it "cannot create an account if passwords do not match" do
    first_name= "Jim"
    last_name = "Jimmy"
    email = "bob@bobby.com"
    password = "password"

    visit "/"
    click_on "Register"
    expect(current_path).to eq("/users/new")

    fill_in :first_name, with: first_name
    fill_in :last_name, with: last_name

    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: "Hi"

    click_on "Create User"

    expect(current_path).to eq("/users/new")
    expect(page).to have_content("Password confirmation doesn't match Password")


  end


end
