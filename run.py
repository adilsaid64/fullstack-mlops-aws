# run.py
import click
import os


@click.command()
@click.option(
    "--pipeline",
    type=str,
    required=True,
    help="Pipeline to run, e.g. 'iris-pipeline'",
)
def main(pipeline: str):

    config_folder = os.path.join(
        os.path.dirname(os.path.realpath(__file__)),
        "configs",
    )

    if pipeline == "iris-pipeline":
        print("Running iris classification pipeline...")
        from pipelines.iris_pipeline import iris_pipeline

        iris_pipeline_args = {}
        iris_pipeline_args["config_path"] = os.path.join(
            config_folder, "iris_pipeline.yaml"
        )
        iris_pipeline.with_options(**iris_pipeline_args)()
    else:
        print(f"Unknown pipeline: {pipeline}")


if __name__ == "__main__":
    main()
