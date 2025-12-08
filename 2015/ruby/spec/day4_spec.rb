# frozen_string_literal: true

require "spec_helper"
require "day4"

RSpec.describe Day4 do
  subject(:day_four) { described_class.new(secret_key) }

  describe "#part_one" do
    subject(:part_one) { day_four.part_one }

    context "for abcdef" do
      let(:secret_key) { "abcdef" }

      it { is_expected.to eq(609043) }
    end

    context "for pqrstuv" do
      let(:secret_key) { "pqrstuv" }

      it { is_expected.to eq(1048970) }
    end
  end
end
