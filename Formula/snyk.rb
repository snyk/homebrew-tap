class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.780.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.780.0/snyk-macos"
    sha256 "994df337e0054385dd170fe9801e754a72c6c084b0eef8976eb15c997c4144f1"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.780.0/snyk-linux"
    sha256 "ae107f239ad835355583ca93a502418027707d7dbad593a74bccb61c7494b44f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
