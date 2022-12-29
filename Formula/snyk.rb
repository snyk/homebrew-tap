class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1079.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1079.0/snyk-macos"
    sha256 "c25bb7573f68df81e8dad3ceaa0067d4cc303fecb202133a99082847e1a3df59"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1079.0/snyk-linux"
    sha256 "cd2f67ce6cfeddfd8dae749905c72ae59f474518d426183236135e78be70e177"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
