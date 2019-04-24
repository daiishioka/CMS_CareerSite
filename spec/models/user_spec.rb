require 'rails_helper'

RSpec.describe User, type: :model do
  #何をテストするのかテストの対象を記述する。メソッドの呼び出しは'#メソッド名'
  describe '#age' do 
    #モックを定義する。
    before do
      allow(Time.zone).to receive(:now).and_return(Time.zone.parse('2019/04/24'))
    end
    
    #どういう条件下で行うテストかを記載する。
    context '20年前の生年月日の場合' do
      #letの引数に指定した名前でブロック内の評価結果を表示できる。
      let(:user) { User.new(birthday: Time.zone.now - 20.years) }
      
      #最終的にどういう状態であるのが正しいのかを定義する
      it '年齢が20歳であること' do
        expect(user.age).to eq 20
      end
    end
    
    context '10年前に生まれた場合でちょうど誕生日の場合' do
      let(:user) { User.new(birthday: Time.zone.parse('2009/04/24')) }
      
      it '年齢が10歳であること' do
        expect(user.age).to eq 10
      end
    end
    
    context '10年前に生まれた場合で誕生日が来ていない場合' do
      let(:user) { User.new(birthday: Time.zone.parse('2009/04/25')) }
      
      it '年齢が9歳であること' do
        expect(user.age).to eq 9
      end
    end
  end
end
