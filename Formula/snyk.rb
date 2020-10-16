class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.414.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.414.0/snyk-macos"
    sha256 "773c28c12a5bbc775a49e2f858482bed9adabcaf8127b385cf465f68d7947d3a"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.414.0/snyk-linux"
    sha256 "dafc9e6500b64b7f3f6bc2cf6f8ec15574926a23edf6452de6257c2be9696899"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
