class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1178.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1178.0/snyk-macos"
    sha256 "7b872d573a730a5692e5f471367f5cfaed3b82f2e1571c0d3e6086035866e964"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1178.0/snyk-linux"
    sha256 "81156e717c3ef6c3a7bc8ea540f8c0984ca225a46f1eb6109b5fec57e2aaffa2"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
