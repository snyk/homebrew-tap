class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1006.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1006.0/snyk-macos"
    sha256 "eeeabd4387418fa4afe5f57bc330d3c8f2a023e0bd5194a8bebce4c8851fe413"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1006.0/snyk-linux"
    sha256 "49d17838b1c069200f1519bbc7ec3fb5e793f9c67bfad9ca2db8504dc659bafa"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
