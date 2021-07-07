class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.655.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.655.0/snyk-macos"
    sha256 "afb13b4b1bbe5476fa7443d5bbb4341ded1b714975e9a762f992212300f6d6e5"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.655.0/snyk-linux"
    sha256 "ca28773a73ce9c1ba5041762b22064be66c704065f277bafce0d9cd3e9580db2"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
