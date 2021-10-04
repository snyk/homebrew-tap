# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class SnykIacRules < Formula
  desc "Write, debug, test, and bundle custom rules for Snyk Infrastructure as Code."
  homepage "https://snyk.io/"
  version "0.2.3"
  license "Apache-2.0"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/snyk/snyk-iac-rules/releases/download/v0.2.3/snyk-iac-rules_0.2.3_Darwin_x86_64.tar.gz"
      sha256 "1b144e1cc4dc3b3563d21d6a548bea8da1b6aa0f19c4be4dfc3bae4408c6640d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/snyk/snyk-iac-rules/releases/download/v0.2.3/snyk-iac-rules_0.2.3_Darwin_arm64.tar.gz"
      sha256 "15a940594fa014f1ea9864c78c29552466b87561b2dc915db7844a055c8f49a2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/snyk/snyk-iac-rules/releases/download/v0.2.3/snyk-iac-rules_0.2.3_Linux_x86_64.tar.gz"
      sha256 "b7655b2467eff2a2d94eb77b9c7ded496f65a1ea81dc886b1750dd285cb95245"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/snyk/snyk-iac-rules/releases/download/v0.2.3/snyk-iac-rules_0.2.3_Linux_arm64.tar.gz"
      sha256 "65422c37e7c1ee80051b8d8752bdc25761d73e4f0faf74dadebb91f2aa51ab1a"
    end
  end

  def install
    bin.install "snyk-iac-rules"
  end
end
