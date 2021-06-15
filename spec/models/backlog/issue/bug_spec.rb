require 'rails_helper'

describe 'Backlog::Issue::Bug' do
  let(:klass) { ; Backlog::Issue::Bug }

  describe '.priority' do
    let(:mid_issue) do
        {
          "priority" => {
            "id" => 3,
            "name" => "中"
          }
        }
    end
    let(:return_value) do
      [mid_issue]
    end

    before do
      #fetchメソッドをスタブ化
      allow(klass).to receive(:fetch).and_return(return_value)
    end

    let(:priority) { klass.priority }

    context 'has_keys' do
      it { priority.has_key?(:length) }
      it { priority.has_key?(:high) }
      it { priority.has_key?(:mid) }
      it { priority.has_key?(:low) }
    end
  end
end