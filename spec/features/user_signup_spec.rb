feature 'User signup' do
  scenario 'User count increases by one on registation' do
    expect { sign_up }.to change(User, :count).by(1)
  end
end
