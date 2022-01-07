class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.818.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.818.0/snyk-macos"
    sha256 "77b6ca906c48b42919a3debafe84b2f163f7f6f882d8849ce9b8f1a7b77e2534"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.818.0/snyk-linux"
    sha256 "6c5cddeeaa55b99a4b5d9bb7672f4e940c75a102739701866d1cd34f2de1c277"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
