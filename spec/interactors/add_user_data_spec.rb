require 'spec_helper'

RSpec.describe AddUserData, type: :interactor do
  subject { AddUserData }
  let(:requested_name) { 'John' }

  context 'when given valid credentials' do
    it 'succeeds' do
      expect(subject.call(params: { name: requested_name }).success?)
        .to be true
    end

    it 'provides the user' do
      expect(subject.call(params: { name: requested_name }).user.name)
        .to eq(requested_name)
    end
  end

  context 'when given invalid credentials' do
    it 'fails' do
      expect(subject.call.success?).to be false
    end

    it 'provides empty params errors' do
      expect(subject.call.errors).to contain_exactly 'There is no params!'
    end

    context 'user validation errors' do
      it 'too short name' do
        short_name = 'a'

        expect(subject.call(params: { name: short_name }).errors)
          .to contain_exactly(
            'Имя не может быть менее 3 символов'
          )
      end

      it 'too long name' do
        long_name = 'a' * 21

        expect(subject.call(params: { name: long_name }).errors)
          .to contain_exactly(
            'Имя не может быть длиннее 20 символов'
          )
      end
    end
  end
end
