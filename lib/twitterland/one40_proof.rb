gem 'one40_proof'
require 'one40_proof/simple'

module TwitterLand
  module One40Proof; end
end

TwitterLand::One40Proof.send(:include, One40Proof) 