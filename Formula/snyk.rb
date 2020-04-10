class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.305.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.305.1/snyk-macos"
    sha256 "b721467dc52889e42338b22c5720744acd13e4def44309eaae7048611cf6c27c"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.305.1/snyk-linux"
    sha256 "428929634da75fbea432c19a126b8516d8f31715e08e0f975dacb736393fec18"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
