# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class SnykIacRules < Formula
  desc "Write, debug, test, and bundle custom rules for Snyk Infrastructure as Code."
  homepage "https://snyk.io/"
  version "0.2.0"
  license "Apache-2.0"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/snyk/snyk-iac-rules/releases/download/v0.2.0/snyk-iac-rules_0.2.0_Darwin_x86_64.tar.gz"
      sha256 "a256404bb671b25e05a4b1f65e5ad2afaf38b094b9add58e55bea87a0243799a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/snyk/snyk-iac-rules/releases/download/v0.2.0/snyk-iac-rules_0.2.0_Darwin_arm64.tar.gz"
      sha256 "93612b638ffd05deb789fbee48a3f4e923d3b94f601d318b3c6058a0f4917945"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/snyk/snyk-iac-rules/releases/download/v0.2.0/snyk-iac-rules_0.2.0_Linux_x86_64.tar.gz"
      sha256 "26d87b6ee1d46907d653599b70ea8162f2534d57cda0e60362700eabd50d4239"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/snyk/snyk-iac-rules/releases/download/v0.2.0/snyk-iac-rules_0.2.0_Linux_arm64.tar.gz"
      sha256 "f3c62d3f8582e3228021e8109aae8be5d79b642bec5144296732a3ca4bfed82e"
    end
  end

  def install
    bin.install "snyk-iac-rules"
  end
end
