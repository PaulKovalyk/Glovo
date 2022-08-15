# frozen_string_literal: true

shared_examples 'Only owner can' do
  it "User can't to do" do
    expect(subject).not_to permit(user)
  end

  it 'Owner can to do' do
    expect(subject).to permit(user_owner)
  end
end
