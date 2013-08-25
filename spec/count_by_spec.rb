# -*- coding: utf-8 -*-

require 'count_by'

describe 'Enumerable#count_by' do
  ID = lambda {|x| x}

  context 'when a block is given' do
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

  context 'when there is no block' do
    it 'returns an enumerator' do
      [].count_by.should be_a Enumerator
    end

    context 'when receiver is empty' do
      subject { [] }
      it 'result is {}' do
        subject.count_by.each(&ID).should == {}
      end
    end

    context 'when receiver is [1, 2, 2, 3]' do
      let(:receiver) { [1, 2, 2, 3] }
      context 'result of count_by(&ID) with enumerator' do
        subject do
          enum = receiver.count_by
          enum.each(&ID)
        end
        it { should == { 1 => 1, 2 => 2, 3 => 1} }
      end

      context 'result of count_by{|x| x % 2} with enumerator' do
        subject do
          enum = receiver.count_by
          enum.each{|x| x % 2}
        end
        it { should == { 1 => 2, 0 => 2} }
      end
    end
  end
end
