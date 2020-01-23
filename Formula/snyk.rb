class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.279.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.279.1/snyk-macos"
    sha256 "5945a0119ba1143cce98d3bf94e760e335f394cbe81f77944f8235aad4642483"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.279.1/snyk-linux"
    sha256 "eeac9dae9f97565d0da36f7aa6df53a10f5186e2fb7eae77df42f61b8f421412"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
