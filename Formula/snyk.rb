class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.307.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.307.0/snyk-macos"
    sha256 "872b193fc983759dab36b1a6d31f946f370b5c4ebf1a12c2e9dda52dfbbf1989"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.307.0/snyk-linux"
    sha256 "2fd52cef615d9ecec6bef6ba55035e26e0594deea1a7d89685b81d790981bc38"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
