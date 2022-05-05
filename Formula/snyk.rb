class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.918.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.918.0/snyk-macos"
    sha256 "b0de2ff1fdf4504eaa5e2c9022b15f6af513d21f9e83797cb4e1dcc3f2fbf1d5"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.918.0/snyk-linux"
    sha256 "5acd530f60abcfbc990c9c02c3f2729b93007b6f1e5b16bf0a2ce0b257347a82"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
