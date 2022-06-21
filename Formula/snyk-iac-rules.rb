# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class SnykIacRules < Formula
  desc "Write, debug, test, and bundle custom rules for Snyk Infrastructure as Code."
  homepage "https://snyk.io/"
  version "1.5.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/snyk/snyk-iac-rules/releases/download/v1.5.3/snyk-iac-rules_1.5.3_Darwin_arm64.tar.gz"
      sha256 "bc6529c0b19df399fbd7bf110a3c3c917b97260e5c24fa2690a55708f91d8ecb"

      def install
        bin.install "snyk-iac-rules"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/snyk/snyk-iac-rules/releases/download/v1.5.3/snyk-iac-rules_1.5.3_Darwin_x86_64.tar.gz"
      sha256 "7cb7f28d28c3ecb654d741176c4579eb8523067e5d923646776e535c2098a818"

      def install
        bin.install "snyk-iac-rules"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/snyk/snyk-iac-rules/releases/download/v1.5.3/snyk-iac-rules_1.5.3_Linux_arm64.tar.gz"
      sha256 "7cb48bfde230b3db0ce5c6b6f757b92d36c0fbdbb094b532f46c831b1b76b778"

      def install
        bin.install "snyk-iac-rules"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/snyk/snyk-iac-rules/releases/download/v1.5.3/snyk-iac-rules_1.5.3_Linux_x86_64.tar.gz"
      sha256 "d2a5753a2a5206134159d30a151c8d9c9de15eb52314f1b3acaf84f0b359f6f2"

      def install
        bin.install "snyk-iac-rules"
      end
    end
  end
end
