require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }

  it 'can be reported broken' do
    subject.report_broken
    expect(subject).to be_broken
  end

end


def release_bike
    fail 'Sorry mate, don\'t be a dock' if empty?
    fail 'No bikes available' if report_broken
    bikes.pop
  end