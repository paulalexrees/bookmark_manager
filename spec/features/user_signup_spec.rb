feature 'User signup' do
  scenario 'User count increases by one on registation' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Hi, paul@paul.com")
  end
end
