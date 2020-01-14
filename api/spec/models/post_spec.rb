# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { post.valid? }
  let(:post) { build(:post, title: title, body: body) }
  let(:title) { 'title' }
  let(:body) { 'body' }

  context 'with title and body' do
    it 'is valid' do is_expected.to be_truthy end
  end

  context 'without title' do
    let(:title) { '' }

    it 'is invalid' do
      is_expected.to be_falsey
      expect(post.errors[:title]).to include("can't be blank")
    end
  end

  context 'without body' do
    let(:body) { '' }

    it 'is invalid' do
      is_expected.to be_falsey
      expect(post.errors[:body]).to include("can't be blank")
    end
  end

  context 'title.length' do
    let(:title) { 'x' * length }
    context 'is 256' do
      let(:length) { 256 }
      it 'is valid' do is_expected.to be_truthy end
    end

    context 'is 257' do
      let(:length) { 257 }
      it 'is invalid' do
        is_expected.to be_falsey
        expect(post.errors[:title])
          .to include('is too long (maximum is 256 characters)')
      end
    end
  end

  context 'body.length' do
    let(:body) { 'x' * length }
    context 'is 1024' do
      let(:length) { 1024 }

      it 'is valid' do is_expected.to be_truthy end
    end

    context 'is 1025' do
      let(:length) { 1025 }

      it 'is invalid' do
        is_expected.to be_falsey
        expect(post.errors[:body])
          .to include('is too long (maximum is 1024 characters)')
      end
    end
  end
end
