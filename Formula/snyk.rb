class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1108.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1108.0/snyk-macos"
    sha256 "fa09450cd393768a879d31115b364cb1fbadefad633fad6d31d8070e210d4485"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1108.0/snyk-linux"
    sha256 "ae4d100a822c169910b315088f7b6a2a0cf7c84bfa79f53905f422982c10e5fd"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
