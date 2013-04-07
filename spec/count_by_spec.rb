# -*- coding: utf-8 -*-

require 'count_by'

describe 'Enumerable#count_by' do
  ID = lambda {|x| x}

  it { expect { [].count_by }.to raise_error ArgumentError }

  context 'when receiver is empty' do
    subject { [] }
    it 'result is {}' do
      subject.count_by(&ID).should == {}
    end
  end

  context 'when receiver is [1, 2, 2, 3]' do
    let(:receiver) { [1, 2, 2, 3] }
    context 'result of count_by(&ID)' do
      subject { receiver.count_by(&ID) }
      it { should == { 1 => 1, 2 => 2, 3 => 1} }
    end

    context 'result of count_by{|x| x % 2}' do
      subject { receiver.count_by{|x| x % 2} }
      it { should == { 1 => 2, 0 => 2} }
    end
  end
end
