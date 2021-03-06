require "rack/test"
require_relative "../lib/rails_conditional_params"

describe ActionController::Parameters do
  before do
    @params = ActionController::Parameters.new(allowed: "allowed", forbidden: "forbidden", maybe: "maybe")
  end
  
  it "should work the same without conditionals" do
    expect(@params.permit(:allowed).to_h).to eq("allowed" => "allowed")
  end
  
  it "should include conditionals when conditionals are true" do
    expect(@params.permit(:allowed, maybe: true).to_h).to eq("allowed" => "allowed", "maybe" => "maybe")
  end
  
  it "should exclude conditionals when conditionals are false" do
    expect(@params.permit(:allowed, maybe: false).to_h).to eq("allowed" => "allowed")
  end
  
  it "should not carry over allowed-ness between separate calls" do
    def filtered(maybe: false)
      @params.permit(:allowed, maybe: maybe).to_h
    end
    
    expect(filtered(maybe: false).to_h).to eq("allowed" => "allowed")
    expect(filtered(maybe: true).to_h).to eq("allowed" => "allowed", "maybe" => "maybe")
    expect(filtered(maybe: false).to_h).to eq("allowed" => "allowed")
    expect(filtered(maybe: true).to_h).to eq("allowed" => "allowed", "maybe" => "maybe")
  end
end