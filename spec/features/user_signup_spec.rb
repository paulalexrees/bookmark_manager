feature 'User signup' do
  scenario 'User count increases by one on registation' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Hi, paul@paul.com")
  end

  scenario 'User types mismatching passwords' do
    visit('/new')
    fill_in(:email, with: 'paul@paul.com')
    fill_in(:password, with: 'password123')
    fill_in(:password_confirmation, with: 'password124')
    click_button('Signup')
    expect(User.count).to eq 0
    expect(page).to have_field("email")
    expect(page).to have_content("Passwords did not match.")
  end
end
