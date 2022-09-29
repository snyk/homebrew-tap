class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1014.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1014.0/snyk-macos"
    sha256 "a6c7aec91cf67223acd7f2b6e2b793f9ddd70649e1740462bd1af65476c78b4f"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1014.0/snyk-linux"
    sha256 "ad45378b3e137f45335ccbd09d39395f6acb60f2375a0971c9942cc959adda4f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
