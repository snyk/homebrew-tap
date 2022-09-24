class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1012.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1012.0/snyk-macos"
    sha256 "8e21ad4dfd16a85918d5673b6dd1faafea07e9057c33fe78d832213b3468cbb6"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1012.0/snyk-linux"
    sha256 "044a4705839caa8dbbb8d6e58398c0e2dca48c80630312b64a261ade981cbb64"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
