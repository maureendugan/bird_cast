require 'spec_helper'

describe Tweet do

  it { should belong_to :user }
  it { should validate_presence_of :text }
  it { should ensure_length_of(:text).
            is_at_least(3).
            is_at_most(150) }


end
