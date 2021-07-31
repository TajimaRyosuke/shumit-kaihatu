require 'rails_helper'
describe 'ユーザーログイン後のテスト' do
  let(:user) { create(:user) }
  let(:genre) { create(:genre) }

before do
  visit new_user_session_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: 'password'

    click_button 'Log in'
end


describe "トップ画面(root_path)のテスト" do
  before do
    visit root_path
  end

  context '表示の確認' do
    it 'root_pathが"/"であるか' do
      expect(current_path).to eq '/'
    end
  end
end

describe "ログイン後のトップページの確認" do
  before do
    visit posts_path
  end
  context '表示の確認' do
    it 'posts_pathが"/posts"であるか' do
      expect(current_path).to eq('/posts')
    end
  end
end

describe "投稿画面(new_post_path)のテスト" do
  before do
    visit new_post_path
  end

  context '表示の確認' do
    it 'new_post_pathが"/posts/new"であるか' do
      expect(current_path).to eq('/posts/new')
    end
  end
end

describe "投稿詳細画面のテスト" do

  let(:post) { create(:post, user_id: user.id , genre_id: genre.id) }

  before do

    # @post = FactoryBot.create(:post)
    # puts @post.inspect

    # @user = FactoryBot.create(:user)
    # puts @user.inspect

    # @genre = FactoryBot.create(:genre)
    # @genre = Genre.create(genre: 'test')
    # puts @genre.inspect

    visit post_path(post)
  end
  context '投稿画像のかくにん' do
    it 'post_titleが表示されているか' do
      expect(page).to have_content post.post_title
      expect(page).to have_content post.opinion
      # expect(page).to have_content post.post_image
    end
  end
  context 'リンクの確認' do
    it '編集ボタンがある' do
      edit_link = find("div.edit-show > a")
	    expect(edit_link.native.inner_text).to match('編集')
    end
    it '編集ボタンの遷移先が編集画面' do
      click_link '編集'
	    expect(current_path).to eq('/posts/' + post.id.to_s + '/edit')
    end
  end
end

describe "投稿編集画面のテスト" do
  let(:post) { create(:post, user_id: user.id , genre_id: genre.id) }

  before do
    visit edit_post_path(post)
  end
  context '表示の確認' do
    it '編集前の投稿内容が表示されているか' do
      expect(page).to have_field 'post[post_title]',with: post.post_title
      expect(page).to have_field 'post[opinion]',with: post.opinion
    end
  end
end
end