require 'rails_helper'

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
  before do
    visit post_path(post)
  end
  context '投稿画像のかくにん' do
    it 'post_titleが表示されているか' do
      expect(page).to have_content post.post_title
    end
  end
end
