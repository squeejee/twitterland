gem 'one40_proof'
require 'one40_proof/simple'

module Twitterland
  module One40Proof; end
end

Twitterland::One40Proof.send(:include, One40Proof) 