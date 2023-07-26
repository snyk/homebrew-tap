class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1196.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1196.0/snyk-macos"
    sha256 "5d96f4ff7303a1d83de52c8059b7793e159a6e412d386746884bee44106c8172"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1196.0/snyk-linux"
    sha256 "568b08aea10810ea632ac1ca55f5cb958b809aea7e11f38136a246d6b21cece5"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
