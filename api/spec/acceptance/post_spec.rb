# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Posts' do
  explanation 'Posts resource'

  # Headers that will be sent in every request.
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
  let(:raw_post) { params.to_json }

  let(:post) do
    Post.create(title: 'Old Title', body: 'Old Body')
  end

  shared_examples_for 'ステータスとボディ' do |label|
    example label do
      do_request request
      expect(status).to eq expected_status
      expect(response_body).to eq expected_body
    end
  end

  route '/api/v1/posts', 'タスクの一覧' do
    get 'ポストの一覧' do
      before { FactoryBot.create_list(:post, 2) }
      let(:request) {}
      let(:expected_status) { 200 }
      let(:expected_body) { Post.order(created_at: :desc).all.to_json }

      it_should_behave_like 'ステータスとボディ', ' 正当なパラメータ'
    end
  end

  route '/api/v1/posts{?title,body}', 'ポスト登録' do
    parameter :title, 'タイトル',
              required: true, type: 'string', example: 'レビュー'
    parameter :body, '概要',
              required: true, type: 'string', example: 'XX機能について'

    post 'ポスト登録' do
      let(:request) { { title: 'New Title', body: 'New Body' } }

      context '成功' do
        let(:expected_status) { 201 }
        let(:expected_body) { Post.last.to_json }

        it_should_behave_like 'ステータスとボディ', ' 正当なパラメータ'
      end

      context 'エラー 1' do
        let(:request) { { title: '', body: '' } }
        let(:request) {}
        let(:expected_status) { 422 }
        let(:expected_body) do
          { title: ["can't be blank"], body: ["can't be blank"] }.to_json
        end

        it_should_behave_like 'ステータスとボディ', '不正（empty）'
      end

      context 'エラー 2' do
        let(:request) { { title: '1' * 257, body: '1' * 1025 } }
        let(:expected_status) { 422 }
        let(:expected_body) do
          {
            title: ['is too long (maximum is 256 characters)'],
            body: ['is too long (maximum is 1024 characters)']
          }.to_json
        end

        it_should_behave_like 'ステータスとボディ', '不正（too_long）'
      end
    end
  end

  route '/api/v1/posts/:id', 'タスク内容' do
    parameter :id, 'ポストID', required: true, type: 'number', example: '1'
    let(:request) {}

    get 'ポスト内容' do
      context '成功' do
        let(:id) { post.id }
        let(:expected_status) { 200 }
        let(:expected_body) { post.to_json }

        it_should_behave_like 'ステータスとボディ', ' 正当なパラメータ'
      end

      context 'エラー' do
        let(:id) { 'a' }
        let(:expected_status) { 404 }
        let(:expected_body) { { error: 'Post does not exist' }.to_json }

        it_should_behave_like 'ステータスとボディ', '不正（id）'
      end
    end
  end

  route '/api/v1/posts/:id{?title,body}', 'ポスト更新' do
    parameter :id, 'ポストID', required: true, type: 'number', example: '1'
    parameter :title, 'タイトル',
              required: true, type: 'string', example: 'レビュー'
    parameter :body, '概要',
              required: true, type: 'string', example: 'XX機能について'
    put 'ポスト更新' do
      let(:id) { post.id }
      let(:request) { { title: 'New Title', body: 'New Body' } }

      context '成功' do
        let(:expected_status) { 200 }
        let(:expected_body) { Post.first.to_json }

        it_should_behave_like 'ステータスとボディ', ' 正当なパラメータ'
      end

      context 'エラー_1' do
        let(:id) { 'a' }
        let(:expected_status) { 404 }
        let(:expected_body) { { error: 'Post does not exist' }.to_json }

        it_should_behave_like 'ステータスとボディ', '不正（id）'
      end

      context 'エラー_2' do
        let(:request) { { title: '', body: '' } }
        let(:expected_status) { 422 }
        let(:expected_body) do
          { title: ["can't be blank"], body: ["can't be blank"] }.to_json
        end

        it_should_behave_like 'ステータスとボディ', '不正（empty）'
      end
    end
  end

  route '/api/v1/posts/:id', 'ポスト削除' do
    parameter :id, 'ポストID', required: true, type: 'number', example: '1'
    let(:request) {}

    delete 'ポスト削除' do
      context '成功' do
        let(:id) { post.id }
        let(:expected_status) { 204 }
        let(:expected_body) { '' }

        it_should_behave_like 'ステータスとボディ', ' 正当なパラメータ'
      end

      context 'エラー' do
        let(:id) { 'a' }
        let(:expected_status) { 404 }
        let(:expected_body) { { error: 'Post does not exist' }.to_json }

        it_should_behave_like 'ステータスとボディ', '不正（id）'
      end
    end
  end
end
