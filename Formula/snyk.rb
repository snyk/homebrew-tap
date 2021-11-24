class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.769.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.769.0/snyk-macos"
    sha256 "c2801e59fea5a6e5c9d92b6432bd5dd2ff4cf1b3abb1e852c1c6ba8723c69751"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.769.0/snyk-linux"
    sha256 "136d0b8a25a3d47ff84cbe5530fcf63f9cea1621c632d0b6e71545d5252ff026"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
