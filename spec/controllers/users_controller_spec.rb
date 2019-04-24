require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    #このコントローラのnewアクションにgetのメソッドでアクセスすることを擬似的に行なっている。
    #この結果が'response'に自動的に格納されている
    before { get :new }
    
    it 'レスポンスコードが200であること' do
      expect(response).to have_http_status(:ok)
    end
    
    it 'newテンプレートをレンダリングすること' do
      expect(response).to render_template :new
    end
    
    it '新しいuserオブジェクトがビューに渡されること' do
      expect(assigns(:user)).to be_a_new User
    end
  end
  
  describe 'POST #create' do
    #明示的にリクエストヘッダーにリファラーの情報を設定できる。
    before do
      @referer = 'http://localhost'
      @request.env['HTTP_REFERER'] = @referer
    end
    
    context '正しいユーザー情報が渡ってきた場合' do
      let(:params) do
        { user: {
            name: 'user',
            sex: '男性',
            email: 'a@a.a',
            birthday: '1992-09-17',
            password: 'password',
            password_confirmation: 'password',
            accepted: 0,
          }
        }
      end
      
      it 'ユーザーが一人増えていること' do
        expect { post :create, params: params }.to change(User, :count).by(1)
      end

      it 'マイページにリダイレクトされること' do
        expect(post :create, params: params).to redirect_to(users_path)
      end
    end
    
    context 'パラメータに正しい確認パスワードが含まれていない場合' do
      before do
        post(:create, params: {
          user: {
            name: 'user',
            sex: '男性',
            email: 'a@a.a',
            birthday: '1992/09/17',
            password: 'password',
            password_confirmation: 'passwoaaa',
            accepted: 0,
          }
        })
      end
      
      it 'リファラーにリダイレクトされること' do
        expect(response).to redirect_to(@referer)
      end

      it 'パスワード確認のエラーメッセージが含まれていること' do
        expect(flash[:error_messages]).to include 'パスワード（確認）とパスワードの入力が一致しません'
      end
    end
  end
end
