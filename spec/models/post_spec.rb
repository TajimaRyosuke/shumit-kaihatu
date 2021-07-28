# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post,"モデルに関するテスト", type: :model do
 describe '実際に保存してみる' do
   it "有効な投稿内容の場合は保存されるか" do
    expect(FactoryBot.build(:post)).to be_valid
   end
 end
 context"空白のバリデーションチェック"do
   it"post_titleが空白の場合にバリデーションチェックされるか" do
    post = Post.new(post_title:'',opinion:'hoge')
    expect(post).to be_invalid
   end
 end
 context"空白のバリデーションチェック"do
   it"opinionが空白の場合にバリデーションチェックされるか" do
     post = Post.new(post_title:'hoge',opinion:'')
     expect(post).to be_invalid
   end
 end
 context"空白のバリデーションチェック"do
   it"全ての項目が空白の場合にバリデーションチェックされるか" do
    post = Post.new(post_title:'',opinion:'')
    expect(post).to be_invalid
   end
 end
end