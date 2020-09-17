class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.398.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.398.1/snyk-macos"
    sha256 "c7dc18954235e40f6788dd6ac4c660c2500130429ee58ffbb81b39a1f9b32c70"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.398.1/snyk-linux"
    sha256 "e49ce080c1026755299b1bb45927603d27aff2166e0540c7310e2a79206bd778"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
