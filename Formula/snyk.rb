class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.431.4"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.431.4/snyk-macos"
    sha256 "72589947e2a2bc9ce0e0a738615e2429b5140353ececc1879b7480a2a8200362"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.431.4/snyk-linux"
    sha256 "6daf0b7ad2ff351151c5b9691d29300436552e238aa86d51bcd929bf8dc89efe"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
