class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1069.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1069.0/snyk-macos"
    sha256 "e18f5c7e901e7e6c166f23339ce92df51ca0e907036013cfe7bb11f218801e7a"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1069.0/snyk-linux"
    sha256 "f8ee3b5863277a003978cec819ce2434cb7f3b0bc4e6b0411bd49e540f8f6edd"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
