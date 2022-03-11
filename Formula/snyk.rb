class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.866.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.866.0/snyk-macos"
    sha256 "675d812dcc23f95dd018cef4a154cf84a39b9f3288e90e85a94dfc59c3d57413"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.866.0/snyk-linux"
    sha256 "256b7c44bf57c0c3988f241a4d5b619fae482911027296394df624a0391a737c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
