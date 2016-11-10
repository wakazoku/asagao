module IntegrationTestHelper
  private
  # ログイン状態にする
  def login_as(name, admin = false)
    member = FactoryGirl.create(:member, name: name, administrator: admin)
    post "/session", name: member.name, password: "password"
  end

  # ログアウト後にする
  def logout
    delete "/session"
  end
end
