class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.996.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.996.0/snyk-macos"
    sha256 "8be6e068a9b8e8b2913d03b1d16af9c655547909c7fb60b08e4c2f7d519bd0d4"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.996.0/snyk-linux"
    sha256 "9490251c6836ff3a851865beab2c815f7956a611779f86ae0701fd80b884e980"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
